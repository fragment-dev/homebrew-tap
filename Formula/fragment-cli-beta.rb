require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4709.0.0-darwin-x64.tar.gz"
    sha256 "f81683bf7f77aa40dc0bfc5a6b5e9778ba56b976af64d3f1e03f24df5521adda"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4709.0.0-darwin-arm64.tar.gz"
      sha256 "c3223c255fcbbc7273878685723ea7dae77ef277646e54b9cb650e73b711ea9d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4709.0.0-linux-x64.tar.gz"
    sha256 "bdb6606c64e70487219d22d084b7761c849ae9a62c63509a09dec80f01c9c947"
  end
  version "4709.0.0"
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
