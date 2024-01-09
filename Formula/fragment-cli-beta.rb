require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4300.0.0-darwin-x64.tar.gz"
    sha256 "156da7ea4fd5bb36bb4d7ac0205f252488d082b46e74be9fa904fbe1d45fca97"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4300.0.0-darwin-arm64.tar.gz"
      sha256 "c762a7facbda722baa0bd02374d2837b2d288e9fea4b9a303366715a628fde32"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4300.0.0-linux-x64.tar.gz"
    sha256 "e72f5a8562bca1237634e8380231aa284e4e15e5b7d46cb8529817ada08268de"
  end
  version "4300.0.0"
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
