require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5253.0.0-darwin-x64.tar.gz"
    sha256 "abf0556188cfb17e74975714331a91d2b8413be6a02240ae565aea4e5738c68f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5253.0.0-darwin-arm64.tar.gz"
      sha256 "efc6fe02694075dffa68b6b4dbeda0f1d8767fcf6985c7e6b84050f4783f972a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5253.0.0-linux-x64.tar.gz"
    sha256 "10d6f1ad38227127f63709a1af8e303f9480f8ba986d2cc82cd70e67ef47db39"
  end
  version "5253.0.0"
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
