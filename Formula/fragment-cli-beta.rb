require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4053.0.0-darwin-x64.tar.gz"
    sha256 "e0af8e15cb7667017a518527c890d321415956361dbcf937ff972ed89fdbc5b3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4053.0.0-darwin-arm64.tar.gz"
      sha256 "8eb26031d90c8fa7c25d0def44b87d60302b2926d1da6fbbf2b7aa6934be846e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4053.0.0-linux-x64.tar.gz"
    sha256 "8e2535ba62fb6f7269b31dd0523691e4b4c5d623e88808f961f8757ab4eb1de2"
  end
  version "4053.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
