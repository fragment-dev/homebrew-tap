require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4547.0.0-darwin-x64.tar.gz"
    sha256 "17dcc66513830fdb0e93976bbe1a36388341a5e3628108bbcf97545735b16cac"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4547.0.0-darwin-arm64.tar.gz"
      sha256 "1cd58182771ac11ac68319759a94cadb5c44dc26fc25fdc1d11e214ce3317308"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4547.0.0-linux-x64.tar.gz"
    sha256 "57ffab8eb601ed10b45a7455bcd724fe7284f366cf8b5dc5a7b87a960dd41446"
  end
  version "4547.0.0"
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
