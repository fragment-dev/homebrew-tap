require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2917.0.0-darwin-x64.tar.gz"
    sha256 "9e7faaebbbaaca49099a524227b4e06140b704f72aaa7b3a0f6eccf8f832677e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2917.0.0-darwin-arm64.tar.gz"
      sha256 "8e92dca79e22dd17f72041dc08ce2794f41bb03526e8628a269efa1084275f73"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2917.0.0-linux-x64.tar.gz"
    sha256 "87f656783aa165e94ada81fb5092ba341a05b593b2ddf31bf35100c4dfbd03a2"
  end
  version "2917.0.0"
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
