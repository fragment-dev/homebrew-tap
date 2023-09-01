require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3468.0.0-darwin-x64.tar.gz"
    sha256 "f7560d9604bf3737c18f6ecf446d48a04b0a1f0e05a50ace87bc32078db48e27"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3468.0.0-darwin-arm64.tar.gz"
      sha256 "cfae2f588a0b53cbde69965b64d8e5108d5b75e20790c1c758f4f4edd7c6c241"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3468.0.0-linux-x64.tar.gz"
    sha256 "f30f54e71220bd5f7a030a61ba4df51d93963f2db051563007431f39d5e8dbb5"
  end
  version "3468.0.0"
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
