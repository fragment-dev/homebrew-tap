require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2565.0.0-darwin-x64.tar.gz"
    sha256 "d2278755a6b9a03d2363a41360e968fc439d8289ebe6b28e22a5a6367777ef25"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2565.0.0-darwin-arm64.tar.gz"
      sha256 "309c29b0d5b866be7cfb428417a710d77792b9ee45018507b1e947562b6ed254"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2565.0.0-linux-x64.tar.gz"
    sha256 "3959801e26c0cd3fe4e786f471a52dbb34646c8d5a1b3c9a83849ff75c98e40e"
  end
  version "2565.0.0"
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
