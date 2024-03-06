require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4716.0.0-darwin-x64.tar.gz"
    sha256 "d3f76806151b3883fb4cad0c031f9c00138ae07f19e5c1a37bd9083dedb40284"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4716.0.0-darwin-arm64.tar.gz"
      sha256 "be589758d85322b69f389a0d9db6eeb033311ce4971322b2fa04340901a21f02"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4716.0.0-linux-x64.tar.gz"
    sha256 "d126dc3822d8141be8a0e96918b4cb73c517b88149a675d9acb1783de0632873"
  end
  version "4716.0.0"
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
