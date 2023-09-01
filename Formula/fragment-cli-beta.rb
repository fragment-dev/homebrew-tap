require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3463.0.0-darwin-x64.tar.gz"
    sha256 "acaeb1a9656884982aa6d34b99ab85e69df4a66df47cb1b4eb1fa3cbbd9484e8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3463.0.0-darwin-arm64.tar.gz"
      sha256 "c66010cde0a623413bc7bd7188f15b075967329aefa65094c950ffbaf7313a69"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3463.0.0-linux-x64.tar.gz"
    sha256 "5ff0c05e60494b4297ac564bd9c005bf71654f5d9ce6ebf2f0960823be9c7eeb"
  end
  version "3463.0.0"
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
