require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2440.0.0-darwin-x64.tar.gz"
    sha256 "578be6b0303089926b24e1df817abb7ddc3401b4ba657a40f676f09dde5487d9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2440.0.0-darwin-arm64.tar.gz"
      sha256 "3db7e0f36297fa34d20717876400826d8dbff19ab922465cd18acf497de3870f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2440.0.0-linux-x64.tar.gz"
    sha256 "3d09fb32ba0f4f91d25a73866c589a1aabb405177344f59898b3754649214950"
  end
  version "2440.0.0"
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
