require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4174.0.0-darwin-x64.tar.gz"
    sha256 "e60c92cfc923a6e14f284cc6b6483406a7217297fa5867564231de4e0da55ade"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4174.0.0-darwin-arm64.tar.gz"
      sha256 "8b684468e8c7a6ca2466a128e451720c20978de2cda5715cc1b20730b715a285"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4174.0.0-linux-x64.tar.gz"
    sha256 "b6b7a108068f930caa937345f135749546054af120861227db2c05f9bc46cac1"
  end
  version "4174.0.0"
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
