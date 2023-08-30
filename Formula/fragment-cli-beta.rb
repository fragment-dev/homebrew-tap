require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3444.0.0-darwin-x64.tar.gz"
    sha256 "8cf9c543ab645c56a0ed31bbb7dee4e1c7cc53272dc6c94bef09ce511e49e97d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3444.0.0-darwin-arm64.tar.gz"
      sha256 "80717f189a74a3a48b460ce052a7209e3a2c5caeab7fc4f0aee8ab44b2d790a7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3444.0.0-linux-x64.tar.gz"
    sha256 "e194290f2a289b887136d163b6ea4371322fb9ab138e1660fb7f9bf51407ea26"
  end
  version "3444.0.0"
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
