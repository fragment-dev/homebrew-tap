require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2439.0.0-darwin-x64.tar.gz"
    sha256 "7c42286a75d1ceb3fda060369616b97f994ae874918f0f7de7ac251399b17e9d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2439.0.0-darwin-arm64.tar.gz"
      sha256 "edd189f2132715e016799b3923756ab836a004e46165a1a1bb1c6de2bc45f0d2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2439.0.0-linux-x64.tar.gz"
    sha256 "51eb74ded8c715781d4a1dc644c3fbf2899b4da9b6e1f0c9442d575690c81883"
  end
  version "2439.0.0"
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
