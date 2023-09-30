require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3729.0.0-darwin-x64.tar.gz"
    sha256 "4a36979f1e0e61fff902d5aeb2d923dc0dc1c81c0e85af18a872f102a5fcc89f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3729.0.0-darwin-arm64.tar.gz"
      sha256 "e602455fa6da093f60bb148dc8091bc9a106c1f676d6c6772f4927425b56b558"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3729.0.0-linux-x64.tar.gz"
    sha256 "83893afc7c4cfbf8e6062db3727531d42c9c3b38291cad0eb105985152ff9b9f"
  end
  version "3729.0.0"
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
