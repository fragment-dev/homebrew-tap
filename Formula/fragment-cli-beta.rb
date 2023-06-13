require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2839.0.0-darwin-x64.tar.gz"
    sha256 "e8adcf4de63cb1656e22a5fe0a4aefabeb2087099e3b4bd3da4c8159c68ff5b9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2839.0.0-darwin-arm64.tar.gz"
      sha256 "6361b49ef54c2b4097548f8b7d4165877e7d869fb35bb5ef08c58ec1a3e99262"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2839.0.0-linux-x64.tar.gz"
    sha256 "651c54ef1a6501e8d613acc72d1328cb770928bb6157632125d10a83eb1065ea"
  end
  version "2839.0.0"
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
