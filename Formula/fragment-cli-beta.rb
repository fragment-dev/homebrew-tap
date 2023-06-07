require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2804.0.0-darwin-x64.tar.gz"
    sha256 "f9b1368a90771d958ec753e0bd718f41d1af948fc609db56fb1caed3e1ab76d6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2804.0.0-darwin-arm64.tar.gz"
      sha256 "db2e989d2c87de9d20d8f3b621d3eff39dd29248146bdacbb3deddc607a2ac76"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2804.0.0-linux-x64.tar.gz"
    sha256 "4250e90aff91f3aedcd715f7665347debbba4b7e72c73fbd552667ce8e83fb91"
  end
  version "2804.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
