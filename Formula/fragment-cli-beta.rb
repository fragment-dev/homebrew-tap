require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5001.0.0-darwin-x64.tar.gz"
    sha256 "b63e0f173a7b53962f0014e907d423ded2b0efc55f48eaf271a6cfff644b5700"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5001.0.0-darwin-arm64.tar.gz"
      sha256 "900de1624194beb6287eed09b7c242cb9eb5bdf23a4dd79d78cd6249710444a8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5001.0.0-linux-x64.tar.gz"
    sha256 "8ef410a3684251182bc4d41844f4d85031f4c0251de4990d29c226fabd324768"
  end
  version "5001.0.0"
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
