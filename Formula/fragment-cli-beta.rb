require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5129.0.0-darwin-x64.tar.gz"
    sha256 "d823706ac95c46a84bad73c4d5aefd706a68510e17cff1ae6b21d2fe7958259f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5129.0.0-darwin-arm64.tar.gz"
      sha256 "44d88086da9f9563fe66035a67900ea3dc15680d039181bda3e7b8f35c76cfd9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5129.0.0-linux-x64.tar.gz"
    sha256 "778ca6646481617ad396d6a7adb725abad3902aa74610771c7ec7174704a126c"
  end
  version "5129.0.0"
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
