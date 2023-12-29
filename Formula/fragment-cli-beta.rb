require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4236.0.0-darwin-x64.tar.gz"
    sha256 "d34c19506031396a852c9d9d1e38ae3daedfa86773c762262c08a7e7de94248c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4236.0.0-darwin-arm64.tar.gz"
      sha256 "e27a45cdaff798c9f0514162101b16172e8c7b27c94833f752e3a44dc1aa0d7a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4236.0.0-linux-x64.tar.gz"
    sha256 "21b8c3ac6c83b30636d4172ecff33fa2b8c713d35532a82951bbe7e4dd2974ba"
  end
  version "4236.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
