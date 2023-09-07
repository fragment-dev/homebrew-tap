require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3500.0.0-darwin-x64.tar.gz"
    sha256 "71eecd6af7710e70e5fe592863ed03315b23aecc224ecd10446b9ca50d2e0ae6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3500.0.0-darwin-arm64.tar.gz"
      sha256 "99c0257ee7468fc3ddc0c7a4ccb15f40cb80fd910c600c8c41844f767ac02f56"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3500.0.0-linux-x64.tar.gz"
    sha256 "748fc7274db8b1af3b30ba3db6c29ebd290b42d14ba8e3b194d3999166af2b13"
  end
  version "3500.0.0"
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
