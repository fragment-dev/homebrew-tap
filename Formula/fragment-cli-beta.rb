require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3230.0.0-darwin-x64.tar.gz"
    sha256 "be43d85cabcababd86465858b21b98480c32d03e37b7e3e751dc8f038d7dda8f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3230.0.0-darwin-arm64.tar.gz"
      sha256 "029ac0e54a20e3a141be9ad620f8b68893cf8aebae79d721fcfcc1c6f44f7a67"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3230.0.0-linux-x64.tar.gz"
    sha256 "fab33d5881afe4870ab0fd71670b537dc1119f1dee04dfdbdaf976d051693a66"
  end
  version "3230.0.0"
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
