require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5168.0.0-darwin-x64.tar.gz"
    sha256 "6b18d37e4ffc31e6c70530f766975f30dbd8825a7a2892374abe07db40d98612"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5168.0.0-darwin-arm64.tar.gz"
      sha256 "749e9687c3e50d01fcd78ee6eab9aa2c1a6130a0d4cd7db1139b041fae513e19"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5168.0.0-linux-x64.tar.gz"
    sha256 "dbdd6d267570b4e11804e580d7556cbf7cee2899237bc9f61a2c14c88d37995a"
  end
  version "5168.0.0"
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
