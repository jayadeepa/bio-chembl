require 'helper'
require 'bio-chembl/chembl.rb'



class TestBioChemblChembId < Test::Unit::TestCase
  def setup
    @str = "CHEMBL1"
    @chemblid = BioChEMBL::ChEMBLID.new(@str)
  end
  
  def test_chemblid
    assert_equal(@chemblid.class, BioChEMBL::ChEMBLID)
    assert_equal(@chemblid, "CHEMBL1")
    assert_equal(@chemblid.data_type, nil)
  end
  
  def test_invalid_chembl_id
    assert_raise(Exception) {
      BioChEMBL::CHEMBLID.new("CHEMBLCHEMBL1")
    }
  end
  
  def test_chemblid_is_compound?
    assert_equal(@chemblid.is_compound?, true)
    assert_equal(@chemblid.data_type, Compound)
  end
  
  def test_chemblid_is_target?
    assert_equal(@chemblid.is_target?, false)    
  end

  def test_chemblid_is_assay?
    assert_equal(@chemblid.is_assay?, false)    
  end
end