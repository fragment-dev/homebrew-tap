require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4978.0.0-darwin-x64.tar.gz"
    sha256 "cedf323beccd2b5df5e7a66e420e99160e15cac24a14c741c3ba49961a1bb37a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4978.0.0-darwin-arm64.tar.gz"
      sha256 "e4174fcc26f2eaaccc711faff718403a372f39d6138f385be98673010958e055"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4978.0.0-linux-x64.tar.gz"
    sha256 "7ed210377d1704bfa1e703d331d1dcfbe8993ba4306ed4e91b6a1d13f59def72"
  end
  version "4978.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
