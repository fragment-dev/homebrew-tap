require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5622.0.0-darwin-x64.tar.gz"
    sha256 "65c00d50148d50b49b6036d52d041235ddeb7f627af3b93226363163ad747f48"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5622.0.0-darwin-arm64.tar.gz"
      sha256 "15d5008daa09d8d92734eb07fed5436e7e7053d408cb49c662d16cd0d7eea676"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5622.0.0-linux-x64.tar.gz"
    sha256 "ad7a7bd6b2f5227306f916733673341d4374ed252243d5af79000b99875cbef3"
  end
  version "5622.0.0"
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
