require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3771.0.0-darwin-x64.tar.gz"
    sha256 "1dd65f9582a8b2603999a17df6fc6d743f812597542b6832c3d99f332bf0a778"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3771.0.0-darwin-arm64.tar.gz"
      sha256 "c9584ebc6595e912479887211b7af22cf292604a4c6cde45314fe8157a0fead4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3771.0.0-linux-x64.tar.gz"
    sha256 "1256ddb41e033d7cc9852650c4d7b90c8afcdc905e575814106eafdbec8eff44"
  end
  version "3771.0.0"
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
