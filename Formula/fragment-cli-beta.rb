require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4705.0.0-darwin-x64.tar.gz"
    sha256 "371d92c10a30e519ac2c6067f8e2a9205c3c8230c6c3a708e116f480215aaf84"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4705.0.0-darwin-arm64.tar.gz"
      sha256 "2da6ed032b359ffb59529fc28439e542283fc8383cd047ad672c7028e22ab0be"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4705.0.0-linux-x64.tar.gz"
    sha256 "3fd0c4628796398a37555a94a234e241613ae461dd14aef4430f6bb5b34e034f"
  end
  version "4705.0.0"
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
