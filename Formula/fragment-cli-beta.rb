require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5579.0.0-darwin-x64.tar.gz"
    sha256 "c665d1fd6533f58b43067b9f952fa9cadd1533ad92ed33a2dcc1eb8b97ffd5af"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5579.0.0-darwin-arm64.tar.gz"
      sha256 "3870ec00b8f319cae5652e622e787bbbc770601922182fb5e9a27aeb18494b9e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5579.0.0-linux-x64.tar.gz"
    sha256 "762fbf97f15c8294e7d7f6c203b95d048ce48534e4f237a673b92edf9692ed75"
  end
  version "5579.0.0"
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
