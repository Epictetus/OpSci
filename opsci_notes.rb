## OpSci-specific notes

## Notes on cron jobs
# http://www.debian-administration.org/articles/56

*     *     *     *     *  Command to be executed
-     -     -     -     -
|     |     |     |     |
|     |     |     |     +----- Day of week (0-7)
|     |     |     +------- Month (1 - 12)
|     |     +--------- Day of month (1 - 31)
|     +----------- Hour (0 - 23)
+------------- Min (0 - 59)

Setup of Cron jobs:

$ cd ~/ && cd .. && cd .. && cd etc/
$ crontab -e # creates new crontab

# paste in:
0   *   *   *   * /bin/ls
# close nano w ctrl + x

# should see:
crontab: installing new crontab


# verify with
crontab -l







#publisher class + adapter

#class Publisher
#  attr_accessor :name, :url, :index, :rss

#  def initialize(name, url, index, rss)
#    @name = name
#    @url = url
#    @index = index
#  end

#end


#final_JSON_file << individual_journal_hashses








## Notes on the Peer-review process

#from IRC #physics

1) How do you get on the list of peer reviewers?
2) Is there a single list or multiple per publisher? 
3) How do they contact you? 
4) Do you have to be approved for the peer reviewing process? 
5) Do you have the option to pass it to someone else or is it mandatory? 
6) Do you get paid for the peer review? Are there any incentives?


lbovard> 5) no you cannot pass along, typically
<lbovard> 6) no you do not get paid
<lbovard> 2) this would be journal dependent
<lbovard> 3) if you are selected for peer review, they would send you the e-mails
<lbovard> 4) approved, well yeah, approved in terms of you are a working scientist, typically in that field so you could assess that work
<delinquentme> so #3 is an email digest ? or do you get an individualized email summon?
<lbovard> 5) unless there is some gigantic conflict of interest, but that should be handled by the editor
<lbovard> are you trying to get into peer review?
<delinquentme> haha I work in a startup who is doing things with academic journals, peer reviews and publishing
<lbovard> and yeah, they would typically e-mail you the journal article


#from IRC #biology
<wonklab> You can call up or email various journals if you want to review stuff.
<hesaid> reviewers are anonymous, right?
<wonklab> There are separate lists for the different journals.
<wonklab> hesaid: mostly
<wonklab> I think there are a few journals that list reviewers.
<wonklab> Also, when you submit a paper, you can usually list a few people you'd like to review your work.
<wonklab> And a few that you'd rather not have as reviewers.
<wonklab> So you can end up being asked even though you never contact the journal to be a reviewer.
<wonklab> You don't get paid.
<wonklab> And you can pass.
<wonklab> They can't make you do it.
<wonklab> Also, there can be plenty of reasons not to.
<wonklab> Like maybe you have a conflict of interest or aren't really knowledgeable enough about their methods.
<delinquentme> wok awesome thanks
<delinquentme> wonklab, ** ^^ =]
<hesaid> Some journals publish the reviewing history of papers as well. It can be fun to read
<delinquentme> so the motivation is ?
<delinquentme> "you should do peer review"
<delinquentme> is there any prestige associated with it?
<wonklab> Sometimes you get the feeling that they actually take the "do not ask" list and ask them to review.
<hesaid> lol
<wonklab> The journal editors will start to be aware of you.
<wonklab> It might be easier to get published in their journal.

