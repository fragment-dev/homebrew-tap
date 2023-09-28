require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3694.0.0-darwin-x64.tar.gz"
    sha256 "9e306e03923df9db445d298656feac707fe50dcfdde7804e5931d7635ac9d9ee"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3694.0.0-darwin-arm64.tar.gz"
      sha256 "b5df88f81d543fea92e395818ade234a8a4c0018aa3ac43161089e6c285483f2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3694.0.0-linux-x64.tar.gz"
    sha256 "51020fe1808f8be06a867adf62e2eea355281e0aaa0aa1df099a10c32553c6c2"
  end
  version "3694.0.0"
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
