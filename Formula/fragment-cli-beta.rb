require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4092.0.0-darwin-x64.tar.gz"
    sha256 "caf26c3c16ae9f95ca195abf2e0d9f94bb1cc5780fa26fdc09972aaeeac10869"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4092.0.0-darwin-arm64.tar.gz"
      sha256 "a36bb59ccb0977b2a4f8eb5f0399bd03f433975c3b3cb84f437fa9e529a95092"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4092.0.0-linux-x64.tar.gz"
    sha256 "d96fef7af348301eaed7470875f31fd59dc19f8b1af75dba68bc2a72d25bd35a"
  end
  version "4092.0.0"
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
