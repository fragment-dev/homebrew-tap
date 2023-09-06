require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.6-1-darwin-x64.tar.gz"
    sha256 "a05aa91822b2b2b23f0b725f237ec0aea9ab9fbca0ed1ce2e1ca5a82bf00fcd5"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.6-1-darwin-arm64.tar.gz"
      sha256 "944714ed06ec83b98f14a9022097a4d7969e5f98bd855543f3b7e20cfdf8b0e5"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.6-1-linux-x64.tar.gz"
    sha256 "4535e56bfc64066d5c791604b038123183fc77c448868ab4724ca31deb529b1f"
  end
  version "2023.9.6-1"
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
