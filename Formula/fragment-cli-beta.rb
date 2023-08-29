require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3416.0.0-darwin-x64.tar.gz"
    sha256 "a9ca709dc94715b793e2518ed2e919dedbf70b9bbcbac4128ba415c6467678bb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3416.0.0-darwin-arm64.tar.gz"
      sha256 "363d2d46008538d6281a20b00adaa673d04ec4b065bdee78c3ed58698fe58569"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3416.0.0-linux-x64.tar.gz"
    sha256 "e8b4b1570c5278ed2c8299c79209d1a87e387a5770db442c06efe4a90ce940b7"
  end
  version "3416.0.0"
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
