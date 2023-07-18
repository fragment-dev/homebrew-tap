require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3104.0.0-darwin-x64.tar.gz"
    sha256 "3a4710067c8770834ca99ea39784e733246161c9a58e1ded5ba821ca5dfc0b6f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3104.0.0-darwin-arm64.tar.gz"
      sha256 "c2b4aa034973e228ba1e6830540e3076b07c817e8d21264f48da6c7133cd8b74"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3104.0.0-linux-x64.tar.gz"
    sha256 "1dd005f4be3302b363368c7f2c20e7910ec22b10d86f37f91883e5d0412eab29"
  end
  version "3104.0.0"
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
