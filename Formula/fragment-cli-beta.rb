require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3312.0.0-darwin-x64.tar.gz"
    sha256 "860264cb6968e0a09038030829ef6e0dda5574ad1206b8db88eee06e27e77912"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3312.0.0-darwin-arm64.tar.gz"
      sha256 "97bd5b0ff099db05eba5fa63ee744b8ca0e0f9555b64d7f03fbd58cb42426108"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3312.0.0-linux-x64.tar.gz"
    sha256 "6068fbf5867f7a698919dfe3e34bc92195013a1c712f4061f99e5cb404ce3632"
  end
  version "3312.0.0"
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
