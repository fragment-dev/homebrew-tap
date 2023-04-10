require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.8-darwin-x64.tar.gz"
    sha256 "da1a92dd98f2fd0110dfd809896916350a4737621ea6d14ac8fd2801c0c976b5"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.8-darwin-arm64.tar.gz"
      sha256 "580160d9f4ae19243661acacb181efb6d5d2e2e20ca90393e5d08165628c2b17"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.8-linux-x64.tar.gz"
    sha256 "931d05f537e2345681be0706f37a693b1c92d436bf6ba1a754a632f7bb8d47c1"
  end
  version "2023.4.8"
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
