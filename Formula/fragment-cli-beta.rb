require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5583.0.0-darwin-x64.tar.gz"
    sha256 "071afa447f9e14b514bdc923a6b0e3fd08a07bfd6728b61f8fdf3616a41d1828"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5583.0.0-darwin-arm64.tar.gz"
      sha256 "f8e15d52067a028a6642646a2ad2fe4c4ed406703daa90aef51cb2eee63b87cf"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5583.0.0-linux-x64.tar.gz"
    sha256 "e905ebde952c3d1b9d6b4ab5e7d0816fc8a163394a426aa7e3fcae6fa2863ecc"
  end
  version "5583.0.0"
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
