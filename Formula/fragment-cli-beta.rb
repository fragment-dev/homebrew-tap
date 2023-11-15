require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4010.0.0-darwin-x64.tar.gz"
    sha256 "b5b911e5aea14d5eee94a6edfbfabb4b42b95a1c03a3e47436ef47665b368fb3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4010.0.0-darwin-arm64.tar.gz"
      sha256 "4e577f4d10c3fdd8db46697a8f7569c8cfa57de7dd537f72cb47570002188a30"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4010.0.0-linux-x64.tar.gz"
    sha256 "ed6c683f8439c44ab126f824a23792543cf8e18aca16b49b6a596493acebe443"
  end
  version "4010.0.0"
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
