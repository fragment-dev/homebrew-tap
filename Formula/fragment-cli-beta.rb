require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3816.0.0-darwin-x64.tar.gz"
    sha256 "c1d8ba5c816e20e12f047ebd9d8dd8ef61cfc542b8bceb4aee1a7ce808f50080"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3816.0.0-darwin-arm64.tar.gz"
      sha256 "e4e7f9d4d39f5d097d1d5e6a655c4d4b2d85ab790be70f24fbd300e1c4d7e9c9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3816.0.0-linux-x64.tar.gz"
    sha256 "ccb0b5ac1b1eafbd7640f1aa7dd8fe5c4b9606c7c53d8e21d70ea31664456d33"
  end
  version "3816.0.0"
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
