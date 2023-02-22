require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2058.0.0-darwin-x64.tar.gz"
    sha256 "dfee86ec63e702c6defde76daedbf7e3404e32970b9ddf9570de36aefaf30fe8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2058.0.0-darwin-arm64.tar.gz"
      sha256 "c59a5362065a434c3dff3cf3262f078d8858cdedfe6561ed831d3ea60ccb172d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2058.0.0-linux-x64.tar.gz"
    sha256 "e7e8c42f420db17ac613332ac63f50349b58f56a5e086c9db00b4ae926eeeac7"
  end
  version "2058.0.0"
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
