require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5632.0.0-darwin-x64.tar.gz"
    sha256 "e28de323047b703e6576dd272c3925810a242e925e7d4b1b4ebe3bc39db00542"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5632.0.0-darwin-arm64.tar.gz"
      sha256 "43c79322c15a0c6bd816ddaabf1b025f691e083c2f0387c514fb83973b36a35f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5632.0.0-linux-x64.tar.gz"
    sha256 "b53824cda1b0b4e955eddf12fa66083d397ea8bf9f23e4d0acf2411541783524"
  end
  version "5632.0.0"
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
