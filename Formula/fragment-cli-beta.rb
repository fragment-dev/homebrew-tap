require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5661.0.0-darwin-x64.tar.gz"
    sha256 "d9367a768c4719f664813482d6695670e4ef26c438d036f9053bd231f89fa039"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5661.0.0-darwin-arm64.tar.gz"
      sha256 "92f7c5890e882146dc03208164195911fd711b23c30655536c98d4a64dc971d7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5661.0.0-linux-x64.tar.gz"
    sha256 "ddb87cbcf4300efc5ad4f73b5a2f46f2f3f746bf6f3fb13e1452d70e2a7bd18e"
  end
  version "5661.0.0"
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
