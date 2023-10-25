require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3901.0.0-darwin-x64.tar.gz"
    sha256 "a9783abb1beb9b92db0a93836a1a9c5df7143f65c0ba6c265d3502d4e61dffe4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3901.0.0-darwin-arm64.tar.gz"
      sha256 "69e9f97f21820752441fa8f39297b3a4c33ed49fb634260a8018139d13c37d46"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3901.0.0-linux-x64.tar.gz"
    sha256 "cff6a39caf6e5401545c4fc3c9785d78dddab447bd3bea025da2e571626d7c6e"
  end
  version "3901.0.0"
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
