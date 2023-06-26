require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2925.0.0-darwin-x64.tar.gz"
    sha256 "bafd889ed3753221eeddbff823d7739bf0b6a9dd11149027797681f86a2fead0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2925.0.0-darwin-arm64.tar.gz"
      sha256 "e86d3628b179c949c2a39b765bb6e215472649995d9215664d6ac567c032ec44"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2925.0.0-linux-x64.tar.gz"
    sha256 "8b2d2fde7ca468ebaa39e9457da0886654ae94ae30843c71288d9587325ff9b3"
  end
  version "2925.0.0"
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
