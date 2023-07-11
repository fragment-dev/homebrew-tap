require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3034.0.0-darwin-x64.tar.gz"
    sha256 "292a39ef612fcdba5b0cf74aa93d4c214de9c4fa9484c5d6ed48903ca9cdc4cd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3034.0.0-darwin-arm64.tar.gz"
      sha256 "14f47c9deb5adf5147019d151ae7a6a6a318c986bceee34fcebe821ef51098dc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3034.0.0-linux-x64.tar.gz"
    sha256 "710785844308c919624f2deaefcfe5e0105feb7c5edd00d8a2efaa9201afcace"
  end
  version "3034.0.0"
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
