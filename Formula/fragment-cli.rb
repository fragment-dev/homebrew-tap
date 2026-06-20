require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2026.6.19-2-darwin-x64.tar.gz"
    sha256 "ce8e2cf2e2b8491fe5c8d465c0f0eae156b7b3d20dfe528ca211a495a526177c"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2026.6.19-2-darwin-arm64.tar.gz"
      sha256 "4d72644872216729ad68be40fc9e7d925658c85cb50056cad830c72b12090e26"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2026.6.19-2-linux-x64.tar.gz"
    sha256 "7dfacde0207d75edda6a0eb2b68d7581c0ced9b450266776d0a6796718fbafb9"
  end
  version "2026.6.19-2"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    # The tarball ships without a Node runtime; point the launcher's
    # $DIR/node lookup at Homebrew's keg-only node@20.
    rm_f libexec/"bin/node"
    (libexec/"bin").install_symlink Formula["node@20"].opt_bin/"node" => "node"
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
