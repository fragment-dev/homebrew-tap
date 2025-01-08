require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6046.0.0-darwin-x64.tar.gz"
    sha256 "ac5080a1443a5664d1ccc0fab383b6c43932fef1060901c2ef0d61c18ab96f40"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6046.0.0-darwin-arm64.tar.gz"
      sha256 "8a0c01c555302f111e7ecfa0997c21bbc9769164dc568d995775aeff3414593b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6046.0.0-linux-x64.tar.gz"
    sha256 "b5245ee709d87aa22e760a5545757b3f410a7acaa03ff2f784d05602aae94813"
  end
  version "6046.0.0"
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
