require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5256.0.0-darwin-x64.tar.gz"
    sha256 "f1d65de36e44cabef0661337fbb8864b9c71fb42957595908ddfa8d1b3dec975"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5256.0.0-darwin-arm64.tar.gz"
      sha256 "039e3f6b2478768f01180c3d8fc16b972a6004d6a1fa911fe17ee72be41de12f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5256.0.0-linux-x64.tar.gz"
    sha256 "94ad5538073669e279e314d011482934a0f34f779959673ebdf1eade54e6b4d9"
  end
  version "5256.0.0"
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
