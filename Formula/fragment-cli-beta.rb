require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4635.0.0-darwin-x64.tar.gz"
    sha256 "19b0f1bdb2a8082fdc206741eec52f12b5371a631473cd0c362842c827d67936"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4635.0.0-darwin-arm64.tar.gz"
      sha256 "9c3d327a477341f77309076668e1fee4142037b4cb2cc058c8798bcbb669c040"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4635.0.0-linux-x64.tar.gz"
    sha256 "2ac1dba2c1497f017e118d436795c12c7fd08063e60f2c2c5e556dbab78b86b8"
  end
  version "4635.0.0"
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
