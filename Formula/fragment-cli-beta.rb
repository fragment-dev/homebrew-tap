require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4262.0.0-darwin-x64.tar.gz"
    sha256 "860df37f5efff7716c18d861fde140667c6170b568a975f0823f7382f744c496"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4262.0.0-darwin-arm64.tar.gz"
      sha256 "01375478f7beb432fe79f78aa826544e4921e912466fac19391c75ad432b34fc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4262.0.0-linux-x64.tar.gz"
    sha256 "bdcea0e59527aa80054f9b0f5c033effe7684b7958eeffc3adcd2dd543f43682"
  end
  version "4262.0.0"
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
