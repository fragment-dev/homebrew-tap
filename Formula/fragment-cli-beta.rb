require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5609.0.0-darwin-x64.tar.gz"
    sha256 "fb730046c9adfd5245ebe70defb2cedda8892df8752294ed038bfd51d80e4b64"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5609.0.0-darwin-arm64.tar.gz"
      sha256 "d918de98daf2a225aa9a2ac483aced6a85ade148bef25faebe97e14b0f98681a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5609.0.0-linux-x64.tar.gz"
    sha256 "86fba9a90993c95f4b9bd4a9a0bb6113cd4b9e2af795b3e8d947dd1134f99829"
  end
  version "5609.0.0"
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
