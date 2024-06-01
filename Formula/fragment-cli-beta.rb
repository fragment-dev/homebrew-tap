require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5169.0.0-darwin-x64.tar.gz"
    sha256 "18d577338edbbac09b800aa359f132942fb0456682f7a592c6d6b450958fb277"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5169.0.0-darwin-arm64.tar.gz"
      sha256 "2e792ab4cc54bf3ad7777627d2df46465a5e6e833fe72a682b79ace6c4b70ff6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5169.0.0-linux-x64.tar.gz"
    sha256 "4461c9d5e49305c033ac13a59d05ab1f91374b70bad7ee01d1e1d37cefc8af85"
  end
  version "5169.0.0"
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
