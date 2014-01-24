
require "mash"

#noinspection RubyTooManyInstanceVariablesInspection,RubyTooManyMethodsInspection
class Reference
  attr_accessor :rt, :rt_num, :rt_string, :sr, :id, :a1, :t1, :jf, :jo, :yr, :fd,
              :vo, :is, :sp, :op, :k1, :ab, :no, :a2, :t2, :ed, :pb, :pp, :a3,
              :a4, :a5, :t3, :sn, :av, :ad, :an, :la, :cl, :sf, :ot, :lk, :do,
              :cn, :db, :ds, :ip, :rd, :st, :u1, :u2, :u3, :u4, :u5, :u6, :u7,
              :u8, :u9, :u10, :u11, :u12, :u13, :u14, :u15, :ul, :sl, :ll, :cr,
              :wt, :a6, :wv, :wp, :ol, :pmid, :pmcid,
              :fl, :cd, :md

  # expecting a HTTParty-parsed RWResult reference hash to be passed in
  def initialize(rawref)

    # Basically, creating an empty ref.  For instance, if you want to
    # hand-construct the reference one field at a time.
    unless rawref["rt"]
      return
    end

    # using Mash so I can use symbols as keys instead of strings, which is what
    # is returned from httparty
    ref = Mash.new(rawref)

    # Here I populate attributes which correspond to RefWorks Tagged Format.
    # See: http://www.refworks.com/rwathens/help/RefWorks_Tagged_Format.htm
    # for more details.  The tag list is in a comment at the end of this file.

    @rt = ref[:rt]

    # the next two are my own extensions, not part of the RefWorks tagged format.
    # They are a decomposition of the rt complex value which I think is useful.
    @rt_num = ref[:rt][:typeOrd]
    @rt_string = ref[:rt][:__content__]

    @sr = ref[:sr]

    @id = ref[:id][0]

    # HTTParty will produce either a string or an array when it converts the XML response
    # to a Ruby data structure.  Which one it produces depends upon how
    # many authors there are.  All values are converted to Arrays, even one item
    # values, for consistency.  I do this for any field which can have more than one value.
    # If not an array, and not a value, set nil
    @a1 = if ref[:a1].class == Array then
            ref[:a1]
          else
            ref[:a1] ? ref[:a1].lines.to_a : nil
          end

    @t1 = ref[:t1]

    @jf = ref[:jf]
    @jo = ref[:jo]
    @yr = ref[:yr]
    @fd = ref[:fd]
    @vo = ref[:vo]
    @is = ref[:is]
    @sp = ref[:sp]
    @op = ref[:op]

    if ref[:k1]
      @k1 = ref[:k1].class == Array ? ref[:k1] : ref[:k1].lines.to_a
    end

    @ab = ref[:ab]
    @no = ref[:no]

    if ref[:a2]
      @a2 = ref[:a2].class == Array ? ref[:a2] : ref[:a2].lines.to_a
    end

    @t2 = ref[:t2]

    @ed = ref[:ed]
    @pb = ref[:pb]
    @pp = ref[:pp]

    if ref[:a3]
      @a3 = ref[:a3].class == Array ? ref[:a3] : ref[:a3].lines.to_a
    end

    if ref[:a4]
      @a4 = ref[:a4].class == Array ? ref[:a4] : ref[:a4].lines.to_a
    end

    if ref[:a5]
      @a5 = ref[:a5].class == Array ? ref[:a5] : ref[:a5].lines.to_a
    end

    @t3 = ref[:t3]
    @sn = ref[:sn]
    @av = ref[:av]
    @ad = ref[:ad]
    @an = ref[:an]
    @la = ref[:la]
    @cl = ref[:cl]
    @sf = ref[:sf]
    @ot = ref[:ot]
    @lk = ref[:lk]
    @do = ref[:do]
    @cn = ref[:cn]
    @db = ref[:db]
    @ds = ref[:ds]
    @ip = ref[:ip]
    @rd = ref[:rd]
    @st = ref[:st]
    @u1 = ref[:u1]
    @u2 = ref[:u2]
    @u3 = ref[:u3]
    @u4 = ref[:u4]
    @u5 = ref[:u5]
    @u6 = ref[:u6]
    @u7 = ref[:u7]
    @u8 = ref[:u8]
    @u9 = ref[:u9]
    @u10 = ref[:u10]
    @u11 = ref[:u11]
    @u12 = ref[:u12]
    @u13 = ref[:u13]
    @u14 = ref[:u14]
    @u15 = ref[:u15]
    @ul = ref[:ul]
    @sl = ref[:sl]
    @ll = ref[:ll]
    @cr = ref[:cr]
    @wt = ref[:wt]

    if ref[:a6]
      @a6 = ref[:a6].class == Array ? ref[:a6] : ref[:a6].lines.to_a
    end

    @wv = ref[:wv]
    @wp = ref[:wp]
    @ol = ref[:ol]
    @pmid = ref[:pmid]
    @pmcid = ref[:pmcid]

    # Not documented as part of the RefWorks tagged format, but the API returns these fields
    @fl = ref[:fl]
    @cd = ref[:cd]
    @md = ref[:md]
  end

  # method to produce RefWorks XML format
  def to_refworks_xml
    @xml = "<reference>"

    @xml << "<rt>#{rt_string}</rt>" if @rt
    @xml << "<sr>#{sr}</sr>" if @sr
    @xml << "<id>#{id}</id>" if @id
    a1.each {|a| @xml << "<a1>#{a}</a1>"} if @a1
    @xml << "<t1>#{t1}</t1>" if @t1
    @xml << "<jf>#{jf}</jf>" if @jf
    @xml << "<jo>#{jo}</jo>" if @jo
    @xml << "<yr>#{yr}</yr>" if @yr
    @xml << "<fd>#{fd}</fd>" if @fd
    @xml << "<vo>#{vo}</vo>" if @vo
    @xml << "<is>#{is}</is>" if @is
    @xml << "<sp>#{sp}</sp>" if @sp
    @xml << "<op>#{op}</op>" if @op
    k1.each {|k| @xml << "<k1>#{k1}</k1>"} if @k1
    @xml << "<ab>#{ab}</ab>" if @ab
    @xml << "<no>#{no}</no>" if @no
    a2.each {|a| @xml << "<a2>#{a}</a2>"} if @a2
    @xml << "<t2>#{t2}</t2>" if @t2
    @xml << "<ed>#{ed}</ed>" if @ed
    @xml << "<pb>#{pb}</pb>" if @pb
    @xml << "<pp>#{pp}</pp>" if @pp
    a3.each {|a| @xml << "<a3>#{a}</a3>"} if @a3
    a4.each {|a| @xml << "<a4>#{a}</a4>"} if @a4
    a5.each {|a| @xml << "<a5>#{a}</a5>"} if @a5
    @xml << "<t3>#{t3}</t3>" if @t3
    @xml << "<sn>#{sn}</sn>" if @sn
    @xml << "<av>#{av}</av>" if @av
    @xml << "<ad>#{ad}</ad>" if @ad
    @xml << "<an>#{an}</an>" if @an
    @xml << "<la>#{la}</la>" if @la
    @xml << "<cl>#{cl}</cl>" if @cl
    @xml << "<sf>#{sf}</sf>" if @sf
    @xml << "<ot>#{ot}</ot>" if @ot
    @xml << "<lk>#{lk}</lk>" if @lk
    @xml << "<do>#{@do}</do>" if @do
    @xml << "<cn>#{cn}</cn>" if @cn
    @xml << "<db>#{db}</db>" if @db
    @xml << "<ds>#{ds}</ds>" if @ds
    @xml << "<ip>#{ip}</ip>" if @ip
    @xml << "<rd>#{rd}</rd>" if @rd
    @xml << "<st>#{st}</st>" if @st
    @xml << "<u1>#{u1}</u1>" if @u1
    @xml << "<u2>#{u2}</u2>" if @u2
    @xml << "<u3>#{u3}</u3>" if @u3
    @xml << "<u4>#{u4}</u4>" if @u4
    @xml << "<u5>#{u5}</u5>" if @u5
    @xml << "<u6>#{u6}</u6>" if @u6
    @xml << "<u7>#{u7}</u7>" if @u7
    @xml << "<u8>#{u8}</u8>" if @u8
    @xml << "<u9>#{u9}</u9>" if @u9
    @xml << "<u10>#{u10}</u10>" if @u10
    @xml << "<u11>#{u11}</u11>" if @u11
    @xml << "<u12>#{u12}</u12>" if @u12
    @xml << "<u13>#{u13}</u13>" if @u13
    @xml << "<u14>#{u14}</u14>" if @u14
    @xml << "<u15>#{u15}</u15>" if @u15
    @xml << "<ul>#{ul}</ul>" if @ul
    @xml << "<sl>#{sl}</sl>" if @sl
    @xml << "<ll>#{ll}</ll>" if @ll
    @xml << "<cr>#{cr}</cr>" if @cr
    @xml << "<wt>#{wt}</wt>" if @wt
    a6.each {|a| @xml << "<a6>#{a}</a6>"} if @a6
    @xml << "<wv>#{wv}</wv>" if @wv
    @xml << "<wp>#{wp}</wp>" if @wp
    @xml << "<ol>#{ol}</ol>" if @ol
    @xml << "<pmid>#{pmid}</pmid>" if @pmid
    @xml << "<pmcid>#{pmcid}</pmcid>" if @pmcid
    # suppressing these - they are not part of the spec and RW trips if you try to add a ref with these
    #@xml << "<fl>#{fl}</fl>" if @fl
    #@xml << "<cd>#{cd}</cd>" if @cd
    #@xml << "<md>#{md}</md>" if @md

    @xml << "</reference>"
    @xml
  end

  # setup human-readable aliases as accessors
  # I've been consistent with the RefWorks tagged format legend (see end of this file)
  # plus I added some additional ones (like "authors" as a synonym for "primary_authors")
  # which seemed particularly useful.

  def reference_type
    rt
  end

  # extension
  def reference_type_num
    rt_num
  end

  # extension
  def reference_type_string
    rt_string
  end

  def source_type
    sr
  end

  def primary_authors
    a1
  end

  # alias
  def authors
    a1
  end

  def primary_title
    t1
  end

  # alias
  def title
    t1
  end

  def periodical_full
    jf
  end

  def periodical_abbrev
    jo
  end

  def publication_year
    yr
  end

  def publication_data_free_form
    fd
  end

  def volume
    vo
  end

  def issue
    is
  end

  def start_page
    sp
  end

  def other_pages
    op
  end

  def keyword
    k1
  end

  def keywords
    k1
  end

  def abstract
    ab
  end

  def notes
    no
  end

  def secondary_authors
    a2
  end

  def secondary_title
    t2
  end

  def edition
    ed
  end

  def publisher
    pb
  end

  def place_of_publication
    pp
  end

  def tertiary_authors
    a3
  end

  def quaternary_authors
    a4
  end

  def quinary_authors
    a5
  end

  def tertiary_title
    t3
  end

  def issn_isbn
    sn
  end

  def availability
    av
  end

  def author_address
    ad
  end

  def accession_number
    an
  end

  def language
    la
  end

  def classification
    cl
  end

  def subfile_database
    sf
  end

  def original_foreign_title
    ot
  end

  def links
    lk
  end

  def digital_object_identifier
    # @ sign to avoid collision with Ruby keyword 'do'
    @do
  end

  # alias
  def doi
    # @ sign to avoid collision with Ruby keyword 'do'
    @do
  end

  def call_number
    cn
  end

  def database
    db
  end

  def data_source
    ds
  end

  def identifying_phrase
    ip
  end

  def retrieved_date
    rd
  end

  def shortened_title
    st
  end

  def user_1
    u1
  end

  def user_2
    u2
  end

  def user_3
    u3
  end

  def user_4
    u4
  end

  def user_5
    u5
  end

  def user_6
    u6
  end

  def user_7
    u7
  end

  def user_8
    u8
  end

  def user_9
    u9
  end

  def user_10
    u10
  end

  def user_11
    u11
  end

  def user_12
    u12
  end

  def user_13
    u13
  end

  def user_14
    u14
  end

  def user_15
    u15
  end

  def url
    ul
  end

  def sponsoring_library
    sl
  end

  def sponsoring_library_location
    ll
  end

  def cited_references
    cr
  end

  def website_title
    wt
  end

  def website_editors
    a6
  end

  def website_version
    wv
  end

  def date_of_electronic_publication
    wp
  end

  def output_language
    ol
  end

  # extension
  def folder
    fl
  end

  # extension
  def created_date
    cd
  end

  # extension
  def modified_data
    md
  end

end

=begin
Refworks Export Tagged Format, Tag legend

RT=Reference Type
SR=Source Type (field is either Print(0) or  Electronic(1) )
ID=Reference Identifier
A1=Primary Authors
T1=Primary Title
JF=Periodical Full
JO=Periodical Abbrev
YR=Publication Year
FD=Publication Data, Free Form
VO=Volume
IS=Issue
SP=Start Page
OP=Other Pages
K1=Keyword
AB=Abstract
NO=Notes
A2=Secondary Authors
T2=Secondary Title
ED=Edition
PB=Publisher
PP=Place of Publication
A3=Tertiary Authors
A4=Quaternary Authors
A5=Quinary Authors
T3=Tertiary Title
SN=ISSN/ISBN
AV=Availability
AD=Author Address
AN=Accession Number
LA=Language
CL=Classification
SF=Subfile/Database
OT=Original Foreign Title
LK=Links
DO=Digital Object Identifier
CN=Call Number
DB=Database
DS=Data Source
IP=Identifying Phrase
RD=Retrieved Date
ST=Shortened Title
U1=User 1
U2=User 2
U3=User 3
U4=User 4
U5=User 5
U6=User 6
U7=User 7
U8=User 8
U9=User 9
U10=User 10
U11=User 11
U12=User 12
U13=User 13
U14=User 14
U15=User 15
UL=URL
SL=Sponsoring Library
LL=Sponsoring Library Location
CR=Cited References
WT=Website Title
A6=Website editors
WV=Website version
WP=Date of Electronic Publication
OL=Output Language (see codes for specific languages below)
PMID=PMID
PMCID=PMCID
=end