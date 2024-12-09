require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5864.0.0-darwin-x64.tar.gz"
    sha256 "ab5ecbc35234329b998b4a9d58b14ffb07b6ce447d8ff2c07be81f5ee58e4484"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5864.0.0-darwin-arm64.tar.gz"
      sha256 "fd049860dd9239ca43d5befd83469acc8475e0877e0197acfc72609d2ef261df"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5864.0.0-linux-x64.tar.gz"
    sha256 "d3acb900170e1cb5a0309c287a2ee22749b60da1ddc88abed694a84e696f5a52"
  end
  version "5864.0.0"
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
